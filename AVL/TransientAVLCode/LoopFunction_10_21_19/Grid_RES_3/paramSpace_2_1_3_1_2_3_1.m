function [aeroForces] = paramSpace_2_1_3_1_2_3_1(sailStates,airStates)

	CL = (6.064110)*sailStates.alpha + (0.485415)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (2.228032)*sailStates.r + (0.010572)*sailStates.de;
	CD = -2.311950;
	CY = (-0.392084)*sailStates.alpha + (-0.024831)*sailStates.beta + (1.071854)*sailStates.p + (-0.000001)*sailStates.q + (0.000000)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.285643)*sailStates.alpha + (-0.403969)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (2.108670)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-13.680431)*sailStates.alpha + (-1.971469)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (-7.603669)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (1.982211)*sailStates.alpha + (0.000183)*sailStates.beta + (-2.387758)*sailStates.p + (10.750408)*sailStates.q + (-0.000294)*sailStates.r + (0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end