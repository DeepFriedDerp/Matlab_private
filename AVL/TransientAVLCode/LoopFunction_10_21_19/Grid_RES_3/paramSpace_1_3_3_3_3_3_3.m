function [aeroForces] = paramSpace_1_3_3_3_3_3_3(sailStates,airStates)

	CL = (3.959154)*sailStates.alpha + (0.027941)*sailStates.beta + (-2.682045)*sailStates.p + (35.075268)*sailStates.q + (-0.419984)*sailStates.r + (0.010422)*sailStates.de;
	CD = -0.063600;
	CY = (0.083562)*sailStates.alpha + (-0.023320)*sailStates.beta + (0.020618)*sailStates.p + (0.665000)*sailStates.q + (0.003699)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.223801)*sailStates.alpha + (-0.012027)*sailStates.beta + (-1.310043)*sailStates.p + (10.743176)*sailStates.q + (-0.126030)*sailStates.r + (0.000521)*sailStates.de;
	Cm = (-14.557608)*sailStates.alpha + (0.007899)*sailStates.beta + (9.330627)*sailStates.p + (-141.044128)*sailStates.q + (1.404895)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.105373)*sailStates.alpha + (-0.003478)*sailStates.beta + (-0.254474)*sailStates.p + (1.260055)*sailStates.q + (-0.026715)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end