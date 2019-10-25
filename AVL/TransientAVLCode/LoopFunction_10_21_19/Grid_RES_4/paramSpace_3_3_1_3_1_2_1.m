function [aeroForces] = paramSpace_3_3_1_3_1_2_1(sailStates,airStates)

	CL = (4.074652)*sailStates.alpha + (-0.016923)*sailStates.beta + (-2.301745)*sailStates.p + (32.863350)*sailStates.q + (0.416958)*sailStates.r + (0.010963)*sailStates.de;
	CD = 0.022350;
	CY = (-0.067691)*sailStates.alpha + (-0.024868)*sailStates.beta + (0.123244)*sailStates.p + (-0.432842)*sailStates.q + (-0.008032)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.110698)*sailStates.alpha + (-0.052829)*sailStates.beta + (-0.976179)*sailStates.p + (7.619533)*sailStates.q + (0.270433)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.744798)*sailStates.alpha + (0.031243)*sailStates.beta + (7.835410)*sailStates.p + (-129.813766)*sailStates.q + (-1.378453)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.099850)*sailStates.alpha + (0.002832)*sailStates.beta + (-0.227530)*sailStates.p + (1.329133)*sailStates.q + (0.001036)*sailStates.r + (0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end