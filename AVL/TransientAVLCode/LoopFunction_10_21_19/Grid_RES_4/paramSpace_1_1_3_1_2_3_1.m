function [aeroForces] = paramSpace_1_1_3_1_2_3_1(sailStates,airStates)

	CL = (5.429244)*sailStates.alpha + (0.375357)*sailStates.beta + (-1.439280)*sailStates.p + (19.793095)*sailStates.q + (1.619541)*sailStates.r + (0.008596)*sailStates.de;
	CD = -2.088930;
	CY = (-0.418694)*sailStates.alpha + (-0.022747)*sailStates.beta + (0.924319)*sailStates.p + (-0.662184)*sailStates.q + (0.183835)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (1.099162)*sailStates.alpha + (-0.318311)*sailStates.beta + (-0.448240)*sailStates.p + (1.592958)*sailStates.q + (1.698958)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-16.255823)*sailStates.alpha + (-1.485681)*sailStates.beta + (6.833703)*sailStates.p + (-109.940704)*sailStates.q + (-5.274149)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (1.954662)*sailStates.alpha + (-0.098078)*sailStates.beta + (-2.142500)*sailStates.p + (10.150019)*sailStates.q + (-0.070522)*sailStates.r + (0.000336)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end