function [aeroForces] = paramSpace_1_2_2_2_1_2_1(sailStates,airStates)

	CL = (5.950812)*sailStates.alpha + (-0.844138)*sailStates.beta + (-5.996467)*sailStates.p + (54.708675)*sailStates.q + (2.588035)*sailStates.r + (0.011038)*sailStates.de;
	CD = -8.441020;
	CY = (2.793951)*sailStates.alpha + (-0.019413)*sailStates.beta + (1.472583)*sailStates.p + (4.166370)*sailStates.q + (0.195050)*sailStates.r + (0.000946)*sailStates.de;

	Cl = (-1.206676)*sailStates.alpha + (-1.055389)*sailStates.beta + (-4.113345)*sailStates.p + (35.250484)*sailStates.q + (2.817652)*sailStates.r + (0.005371)*sailStates.de;
	Cm = (6.470914)*sailStates.alpha + (3.658904)*sailStates.beta + (22.530836)*sailStates.p + (-237.401215)*sailStates.q + (-8.847191)*sailStates.r + (-0.082117)*sailStates.de;
	Cn = (-10.399003)*sailStates.alpha + (-0.104377)*sailStates.beta + (-3.932125)*sailStates.p + (16.646473)*sailStates.q + (-0.080095)*sailStates.r + (-0.000814)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end