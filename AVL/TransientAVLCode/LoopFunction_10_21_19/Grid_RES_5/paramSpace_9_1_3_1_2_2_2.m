function [aeroForces] = paramSpace_9_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.472840)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.112053)*sailStates.p + (39.897400)*sailStates.q + (1.242791)*sailStates.r + (0.011517)*sailStates.de;
	CD = -0.595320;
	CY = (0.222513)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.507162)*sailStates.p + (0.910012)*sailStates.q + (-0.017679)*sailStates.r + (0.000199)*sailStates.de;

	Cl = (1.365842)*sailStates.alpha + (-0.290418)*sailStates.beta + (-1.640265)*sailStates.p + (13.858946)*sailStates.q + (1.153155)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-13.678906)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.439142)*sailStates.p + (-151.817017)*sailStates.q + (-4.245905)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (-0.431629)*sailStates.alpha + (0.010142)*sailStates.beta + (-1.109213)*sailStates.p + (4.141160)*sailStates.q + (0.000369)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end