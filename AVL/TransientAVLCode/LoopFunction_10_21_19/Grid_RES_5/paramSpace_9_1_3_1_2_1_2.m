function [aeroForces] = paramSpace_9_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.019439)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.076314)*sailStates.p + (38.260708)*sailStates.q + (-1.317110)*sailStates.r + (0.011184)*sailStates.de;
	CD = -0.906610;
	CY = (-0.037889)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.705793)*sailStates.p + (0.910009)*sailStates.q + (0.024679)*sailStates.r + (0.000199)*sailStates.de;

	Cl = (1.872482)*sailStates.alpha + (0.316060)*sailStates.beta + (-1.628959)*sailStates.p + (13.426825)*sailStates.q + (-1.243878)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-15.160954)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.742984)*sailStates.p + (-151.817017)*sailStates.q + (4.454979)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (0.183457)*sailStates.alpha + (-0.011037)*sailStates.beta + (1.611190)*sailStates.p + (-8.233139)*sailStates.q + (-0.010900)*sailStates.r + (-0.000418)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end