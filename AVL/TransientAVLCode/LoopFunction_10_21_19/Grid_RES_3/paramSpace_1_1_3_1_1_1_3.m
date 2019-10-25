function [aeroForces] = paramSpace_1_1_3_1_1_1_3(sailStates,airStates)

	CL = (5.075840)*sailStates.alpha + (-0.584417)*sailStates.beta + (-3.542808)*sailStates.p + (49.002731)*sailStates.q + (-2.982073)*sailStates.r + (0.012594)*sailStates.de;
	CD = -1.842460;
	CY = (-0.547021)*sailStates.alpha + (-0.022373)*sailStates.beta + (-1.040912)*sailStates.p + (-1.081938)*sailStates.q + (-0.183644)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.201491)*sailStates.alpha + (0.379595)*sailStates.beta + (-1.990033)*sailStates.p + (18.865494)*sailStates.q + (-2.559542)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-9.177861)*sailStates.alpha + (2.158338)*sailStates.beta + (10.271804)*sailStates.p + (-160.704926)*sailStates.q + (9.919564)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (1.803345)*sailStates.alpha + (0.098058)*sailStates.beta + (2.097453)*sailStates.p + (-7.432574)*sailStates.q + (-0.019605)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end