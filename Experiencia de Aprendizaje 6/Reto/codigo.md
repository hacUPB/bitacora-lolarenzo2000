# Codigo

## ``ofApp.h``
``` cpp
#pragma once

#include "ofMain.h"
#include <string>
#include <vector>

class Observer {
public:
	virtual void onNotify(const std::string & event) = 0;
};

class Subject {
public:
	void addObserver(Observer * observer);
	void removeObserver(Observer * observer);

protected:
	void notify(const std::string & event);

private:
	std::vector<Observer *> observers;
};

class Particle;

class State {
public:
	virtual void update(Particle * particle) = 0;
	virtual void onEnter(Particle * particle) { }
	virtual void onExit(Particle * particle) { }
	virtual ~State() = default;
};

class Particle : public Observer {
public:
	Particle();
	~Particle();

	void update();
	void draw();
	void onNotify(const std::string & event) override;
	void setState(State * newState);

	ofVec2f position;
	ofVec2f velocity;
	float mass;
	float size;
	ofColor color;

private:
	State * state;
};

class NormalState : public State {
public:
	void update(Particle * particle) override;
	virtual void onEnter(Particle * particle) override;
};

class InvertState : public State {
public:
	void update(Particle * particle) override;
	virtual void onEnter(Particle * particle) override;
};

class StopState : public State {
public:
	void update(Particle * particle) override;
};

class ParticleFactory {
public:
	static Particle * createParticle(const std::string & type);
};

class ofApp : public ofBaseApp, public Subject {
public:
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
	void mouseDragged(int x, int y, int button);

private:
	std::vector<Particle *> particles;
};
```


## ``ofApp.cpp``


```cpp
#include "ofApp.h"

void Subject::addObserver(Observer * observer) {
	observers.push_back(observer);
}

void Subject::removeObserver(Observer * observer) {
	observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
}

void Subject::notify(const std::string & event) {
	for (Observer * observer : observers) {
		observer->onNotify(event);
	}
}

Particle::Particle() {
	// Inicializar propiedades
	position = ofVec2f(ofGetMouseX(), ofGetMouseY());
	velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
	size = ofRandom(2, 5);
	color = ofColor(255);
	state = new NormalState();
}

Particle::~Particle() {
	delete state;
}

void Particle::setState(State * newState) {
	if (state != nullptr) {
		state->onExit(this);
		delete state;
	}
	state = newState;
	if (state != nullptr) {
		state->onEnter(this);
	}
}

void Particle::update() {
	if (state != nullptr) {
		state->update(this);
	}
	// Mantener las partículas dentro de la ventana
	if (position.x - size < 0) {
		if (velocity.x < 0) {
			velocity.x *= -1;
		}
	}
	else if (position.x + size > ofGetWidth()) {
		if (velocity.x > 0) {
			velocity.x *= -1;
		}
	}
	if (position.y + size >= ofGetHeight()) {
		if (velocity.y > 0) {
			velocity.y *= -ofRandom(0.9, 1.1);
		}		
	}else if (position.y - size < 0) {
		if (velocity.y < 0) {
			velocity.y *= -ofRandom(0.9, 1.1);
		}
	}
}

void Particle::draw() {
	ofSetColor(color);
	ofDrawCircle(position, size);
}

void Particle::onNotify(const std::string & event) {
	if (event == "invert") {
		setState(new InvertState());
	} else if (event == "stop") {
		setState(new StopState());
	} else if (event == "normal") {
		setState(new NormalState());
	}
}

void NormalState::update(Particle * particle) {
	particle->position += particle->velocity;
	particle->velocity.y += particle->mass;
}

void NormalState::onEnter(Particle * particle) {
	particle->velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
}

void InvertState::update(Particle * particle) {
	particle->position += particle->velocity;
	particle->velocity.y -= particle->mass;
}

void InvertState::onEnter(Particle* particle) {
	particle->velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
}

void StopState::update(Particle * particle) {
	particle->velocity.x = 0;
	particle->velocity.y = 0;
}

Particle * ParticleFactory::createParticle(const std::string & type) {
	Particle * particle = new Particle();

	if (type == "star") {
		particle->size = ofRandom(9, 14);
		particle->color = ofColor(255, 0, 0);
		particle->mass = 0.01;
	} else if (type == "shooting_star") {
		particle->size = ofRandom(3, 6);
		particle->color = ofColor(0, 255, 0);
		particle->velocity *= 3;
		particle->mass = 0.1;
	} else if (type == "planet") {
		particle->size = ofRandom(5, 8);
		particle->color = ofColor(0, 0, 255);
		particle->mass = 0.05;
	}
	return particle;
}
void ofApp::mouseDragged(int x, int y, int button) {
	if (button == OF_MOUSE_BUTTON_LEFT) {
		Particle * p = ParticleFactory::createParticle("planet");
		particles.push_back(p);
		addObserver(p);
	}
	if (button == OF_MOUSE_BUTTON_RIGHT) {
		Particle * p = ParticleFactory::createParticle("shooting_star");
		particles.push_back(p);
		addObserver(p);
	}
	if (button == OF_MOUSE_BUTTON_MIDDLE) {
		Particle * p = ParticleFactory::createParticle("star");
		particles.push_back(p);
	}
	
}

void ofApp::setup() {
	ofBackground(0);
}

void ofApp::update() {
	for (Particle * p : particles) {
		p->update();
	}
}

void ofApp::draw() {
	for (Particle * p : particles) {
		p->draw();
	}
}

void ofApp::keyPressed(int key) {
	if (key == 's') {
		notify("stop");
	} else if (key == 'i') {
		notify("invert");
	} else if (key == 'n') {
		notify("normal");
	}
}

```