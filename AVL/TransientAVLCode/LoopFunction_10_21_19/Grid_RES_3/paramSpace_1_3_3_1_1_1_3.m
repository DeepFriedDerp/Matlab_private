function [aeroForces] = paramSpace_1_3_3_1_1_1_3(sailStates,airStates)

	CL = (5.075839)*sailStates.alpha + (0.584417)*sailStates.beta + (-3.542808)*sailStates.p + (49.002735)*sailStates.q + (-2.982073)*sailStates.r + (0.012594)*sailStates.de;
	CD = -1.842460;
	CY = (-0.547021)*sailStates.alpha + (-0.027289)*sailStates.beta + (-1.040912)*sailStates.p + (-1.081938)*sailStates.q + (-0.183644)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.128160)*sailStates.alpha + (0.737618)*sailStates.beta + (-1.905381)*sailStates.p + (17.804623)*sailStates.q + (-2.544716)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-9.177860)*sailStates.alpha + (-2.158338)*sailStates.beta + (10.271805)*sailStates.p + (-160.704956)*sailStates.q + (9.919564)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (1.655479)*sailStates.alpha + (0.098937)*sailStates.beta + (2.112380)*sailStates.p + (-7.619634)*sailStates.q + (-0.016991)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end