function [aeroForces] = paramSpace_2_1_3_1_3_2_1(sailStates,airStates)

	CL = (3.856819)*sailStates.alpha + (-0.029653)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (-0.434646)*sailStates.r + (0.010572)*sailStates.de;
	CD = -0.025160;
	CY = (0.304050)*sailStates.alpha + (-0.024405)*sailStates.beta + (-0.255355)*sailStates.p + (1.697132)*sailStates.q + (0.000159)*sailStates.r + (0.000359)*sailStates.de;

	Cl = (0.782102)*sailStates.alpha + (0.032312)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (-0.331978)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-13.942674)*sailStates.alpha + (0.027983)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (1.433804)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (-0.593758)*sailStates.alpha + (-0.000649)*sailStates.beta + (0.533851)*sailStates.p + (-3.788849)*sailStates.q + (-0.000442)*sailStates.r + (-0.000526)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end