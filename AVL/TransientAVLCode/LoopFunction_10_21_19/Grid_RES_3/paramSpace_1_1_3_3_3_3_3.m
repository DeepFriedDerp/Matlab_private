function [aeroForces] = paramSpace_1_1_3_3_3_3_3(sailStates,airStates)

	CL = (3.959153)*sailStates.alpha + (-0.027941)*sailStates.beta + (-2.682046)*sailStates.p + (35.075268)*sailStates.q + (-0.419984)*sailStates.r + (0.010422)*sailStates.de;
	CD = -0.063600;
	CY = (0.083562)*sailStates.alpha + (-0.026342)*sailStates.beta + (0.020618)*sailStates.p + (0.665000)*sailStates.q + (0.003699)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.347082)*sailStates.alpha + (-0.063567)*sailStates.beta + (-1.394695)*sailStates.p + (11.804044)*sailStates.q + (-0.140856)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-14.557609)*sailStates.alpha + (-0.007899)*sailStates.beta + (9.330627)*sailStates.p + (-141.044128)*sailStates.q + (1.404895)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.118291)*sailStates.alpha + (-0.009851)*sailStates.beta + (-0.269401)*sailStates.p + (1.447115)*sailStates.q + (-0.029330)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end