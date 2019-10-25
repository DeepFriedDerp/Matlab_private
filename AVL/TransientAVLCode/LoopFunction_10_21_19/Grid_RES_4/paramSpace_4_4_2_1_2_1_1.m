function [aeroForces] = paramSpace_4_4_2_1_2_1_1(sailStates,airStates)

	CL = (5.429244)*sailStates.alpha + (0.375357)*sailStates.beta + (-1.439280)*sailStates.p + (19.793095)*sailStates.q + (-1.619542)*sailStates.r + (0.008596)*sailStates.de;
	CD = -2.088930;
	CY = (0.418694)*sailStates.alpha + (-0.026825)*sailStates.beta + (-0.924319)*sailStates.p + (0.662184)*sailStates.q + (0.183835)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (0.897454)*sailStates.alpha + (0.549589)*sailStates.beta + (-0.353851)*sailStates.p + (0.405077)*sailStates.q + (-1.717690)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-16.255823)*sailStates.alpha + (-1.485681)*sailStates.beta + (6.833702)*sailStates.p + (-109.940704)*sailStates.q + (5.274150)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-2.032821)*sailStates.alpha + (-0.074558)*sailStates.beta + (2.123725)*sailStates.p + (-9.913735)*sailStates.q + (-0.066796)*sailStates.r + (-0.000336)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end