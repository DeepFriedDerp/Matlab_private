function [aeroForces] = paramSpace_4_3_4_1_3_3_3(sailStates,airStates)

	CL = (5.040290)*sailStates.alpha + (-0.250238)*sailStates.beta + (-3.549968)*sailStates.p + (50.278801)*sailStates.q + (3.170399)*sailStates.r + (0.012558)*sailStates.de;
	CD = -1.885480;
	CY = (0.571294)*sailStates.alpha + (-0.026147)*sailStates.beta + (1.116521)*sailStates.p + (1.002338)*sailStates.q + (-0.221982)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.113834)*sailStates.alpha + (-0.670057)*sailStates.beta + (-1.930567)*sailStates.p + (18.456148)*sailStates.q + (2.730042)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-8.217546)*sailStates.alpha + (0.970686)*sailStates.beta + (10.003734)*sailStates.p + (-161.102386)*sailStates.q + (-10.568229)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-1.826920)*sailStates.alpha + (0.119608)*sailStates.beta + (-2.215549)*sailStates.p + (7.651418)*sailStates.q + (-0.026500)*sailStates.r + (-0.000074)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end