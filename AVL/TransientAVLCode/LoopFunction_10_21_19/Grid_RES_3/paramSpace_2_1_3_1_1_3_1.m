function [aeroForces] = paramSpace_2_1_3_1_1_3_1(sailStates,airStates)

	CL = (7.179646)*sailStates.alpha + (0.540200)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (2.672451)*sailStates.r + (0.010572)*sailStates.de;
	CD = -2.938690;
	CY = (-0.703367)*sailStates.alpha + (-0.025257)*sailStates.beta + (1.346823)*sailStates.p + (-1.697127)*sailStates.q + (-0.000159)*sailStates.r + (-0.000359)*sailStates.de;

	Cl = (2.225865)*sailStates.alpha + (-0.446449)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (2.471494)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-15.343563)*sailStates.alpha + (-2.159155)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (-9.093120)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (2.595220)*sailStates.alpha + (0.000811)*sailStates.beta + (-2.950511)*sailStates.p + (14.554940)*sailStates.q + (-0.000060)*sailStates.r + (0.000679)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end