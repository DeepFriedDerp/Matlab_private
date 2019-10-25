function [aeroForces] = paramSpace_4_2_4_1_3_3_3(sailStates,airStates)

	CL = (5.040289)*sailStates.alpha + (0.250238)*sailStates.beta + (-3.549968)*sailStates.p + (50.278793)*sailStates.q + (3.170400)*sailStates.r + (0.012558)*sailStates.de;
	CD = -1.885480;
	CY = (0.571294)*sailStates.alpha + (-0.023806)*sailStates.beta + (1.116521)*sailStates.p + (1.002338)*sailStates.q + (-0.221982)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.139191)*sailStates.alpha + (-0.524481)*sailStates.beta + (-1.962099)*sailStates.p + (18.853111)*sailStates.q + (2.736357)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-8.217546)*sailStates.alpha + (-0.970687)*sailStates.beta + (10.003733)*sailStates.p + (-161.102386)*sailStates.q + (-10.568230)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-1.886204)*sailStates.alpha + (0.118000)*sailStates.beta + (-2.209277)*sailStates.p + (7.572457)*sailStates.q + (-0.027756)*sailStates.r + (-0.000074)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end