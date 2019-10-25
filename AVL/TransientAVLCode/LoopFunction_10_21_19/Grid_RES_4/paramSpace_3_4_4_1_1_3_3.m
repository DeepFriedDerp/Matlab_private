function [aeroForces] = paramSpace_3_4_4_1_1_3_3(sailStates,airStates)

	CL = (7.311780)*sailStates.alpha + (-0.697538)*sailStates.beta + (-3.472269)*sailStates.p + (44.648438)*sailStates.q + (3.126631)*sailStates.r + (0.011819)*sailStates.de;
	CD = -3.031980;
	CY = (0.279046)*sailStates.alpha + (-0.022135)*sailStates.beta + (1.457325)*sailStates.p + (-1.915493)*sailStates.q + (-0.095720)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (2.986706)*sailStates.alpha + (-0.853753)*sailStates.beta + (-1.880219)*sailStates.p + (16.547028)*sailStates.q + (2.795708)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-14.137291)*sailStates.alpha + (2.754590)*sailStates.beta + (10.949553)*sailStates.p + (-159.650192)*sailStates.q + (-10.607178)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-1.433968)*sailStates.alpha + (0.035941)*sailStates.beta + (-3.083792)*sailStates.p + (14.860509)*sailStates.q + (0.026877)*sailStates.r + (0.000825)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end