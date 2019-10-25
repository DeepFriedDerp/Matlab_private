function [aeroForces] = paramSpace_1_3_4_3_3_1_3(sailStates,airStates)

	CL = (4.347410)*sailStates.alpha + (0.119873)*sailStates.beta + (-2.767511)*sailStates.p + (39.755676)*sailStates.q + (-1.860418)*sailStates.r + (0.011354)*sailStates.de;
	CD = -0.252220;
	CY = (0.024858)*sailStates.alpha + (-0.024320)*sailStates.beta + (-0.611720)*sailStates.p + (0.684399)*sailStates.q + (-0.121605)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.497021)*sailStates.alpha + (0.319328)*sailStates.beta + (-1.360451)*sailStates.p + (12.327188)*sailStates.q + (-1.437375)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-13.192801)*sailStates.alpha + (-0.411597)*sailStates.beta + (8.396229)*sailStates.p + (-141.172913)*sailStates.q + (6.151371)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.178779)*sailStates.alpha + (0.054874)*sailStates.beta + (1.156154)*sailStates.p + (-4.960382)*sailStates.q + (-0.002489)*sailStates.r + (-0.000315)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end