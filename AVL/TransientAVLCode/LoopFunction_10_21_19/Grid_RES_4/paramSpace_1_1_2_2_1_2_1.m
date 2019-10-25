function [aeroForces] = paramSpace_1_1_2_2_1_2_1(sailStates,airStates)

	CL = (3.711138)*sailStates.alpha + (-0.166046)*sailStates.beta + (-2.095853)*sailStates.p + (31.610334)*sailStates.q + (-0.633331)*sailStates.r + (0.010252)*sailStates.de;
	CD = 0.072960;
	CY = (-0.119470)*sailStates.alpha + (-0.021311)*sailStates.beta + (-0.059119)*sailStates.p + (-1.057314)*sailStates.q + (-0.011722)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.007016)*sailStates.alpha + (0.033015)*sailStates.beta + (-0.897126)*sailStates.p + (7.324272)*sailStates.q + (-0.406552)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-13.367319)*sailStates.alpha + (0.639839)*sailStates.beta + (7.112627)*sailStates.p + (-124.043571)*sailStates.q + (2.167902)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.202358)*sailStates.alpha + (0.007737)*sailStates.beta + (0.017379)*sailStates.p + (1.236469)*sailStates.q + (-0.041999)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end