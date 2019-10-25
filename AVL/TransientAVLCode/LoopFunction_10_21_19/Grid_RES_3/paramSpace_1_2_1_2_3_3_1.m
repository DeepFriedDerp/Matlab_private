function [aeroForces] = paramSpace_1_2_1_2_3_3_1(sailStates,airStates)

	CL = (3.994239)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.022139)*sailStates.p + (28.912495)*sailStates.q + (0.072412)*sailStates.r + (0.009825)*sailStates.de;
	CD = -0.219850;
	CY = (0.028711)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.174582)*sailStates.p + (0.491415)*sailStates.q + (0.030737)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (0.961159)*sailStates.alpha + (-0.106889)*sailStates.beta + (-0.819533)*sailStates.p + (6.019897)*sailStates.q + (0.265660)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-14.585196)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.396955)*sailStates.p + (-123.667763)*sailStates.q + (-0.178192)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (0.309885)*sailStates.alpha + (-0.018847)*sailStates.beta + (-0.542977)*sailStates.p + (2.524877)*sailStates.q + (-0.023517)*sailStates.r + (-0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end