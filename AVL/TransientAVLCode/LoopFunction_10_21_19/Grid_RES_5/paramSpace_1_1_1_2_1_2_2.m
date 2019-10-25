function [aeroForces] = paramSpace_1_1_1_2_1_2_2(sailStates,airStates)

	CL = (3.667787)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.594533)*sailStates.p + (34.909298)*sailStates.q + (-0.683874)*sailStates.r + (0.009887)*sailStates.de;
	CD = 0.049170;
	CY = (-0.025595)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.015547)*sailStates.p + (-0.199285)*sailStates.q + (-0.003855)*sailStates.r + (-0.000042)*sailStates.de;

	Cl = (1.230837)*sailStates.alpha + (0.015603)*sailStates.beta + (-1.295404)*sailStates.p + (10.974440)*sailStates.q + (-0.367162)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-13.581521)*sailStates.alpha + (0.000000)*sailStates.beta + (9.052264)*sailStates.p + (-139.959488)*sailStates.q + (2.395683)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (0.298848)*sailStates.alpha + (0.003890)*sailStates.beta + (-0.256509)*sailStates.p + (2.525790)*sailStates.q + (-0.075254)*sailStates.r + (0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end