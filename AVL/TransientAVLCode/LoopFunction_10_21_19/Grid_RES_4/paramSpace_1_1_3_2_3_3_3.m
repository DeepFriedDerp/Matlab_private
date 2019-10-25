function [aeroForces] = paramSpace_1_1_3_2_3_3_3(sailStates,airStates)

	CL = (3.972648)*sailStates.alpha + (-0.004991)*sailStates.beta + (-2.749591)*sailStates.p + (34.814186)*sailStates.q + (-0.301177)*sailStates.r + (0.009996)*sailStates.de;
	CD = -0.217690;
	CY = (0.141820)*sailStates.alpha + (-0.028041)*sailStates.beta + (0.087893)*sailStates.p + (1.057314)*sailStates.q + (0.017521)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.362450)*sailStates.alpha + (-0.110420)*sailStates.beta + (-1.481339)*sailStates.p + (12.575369)*sailStates.q + (-0.007778)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-14.433431)*sailStates.alpha + (-0.077673)*sailStates.beta + (9.775442)*sailStates.p + (-143.598221)*sailStates.q + (1.044299)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.072294)*sailStates.alpha + (-0.022276)*sailStates.beta + (-0.490460)*sailStates.p + (2.429811)*sailStates.q + (-0.040602)*sailStates.r + (-0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end