function [aeroForces] = paramSpace_4_2_3_3_1_2_2(sailStates,airStates)

	CL = (3.919620)*sailStates.alpha + (0.078054)*sailStates.beta + (-2.465351)*sailStates.p + (35.387032)*sailStates.q + (1.115966)*sailStates.r + (0.010589)*sailStates.de;
	CD = 0.055980;
	CY = (-0.063165)*sailStates.alpha + (-0.025514)*sailStates.beta + (0.306712)*sailStates.p + (-0.489619)*sailStates.q + (-0.061026)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.282162)*sailStates.alpha + (-0.109420)*sailStates.beta + (-1.169686)*sailStates.p + (10.131921)*sailStates.q + (0.795116)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-13.612066)*sailStates.alpha + (-0.288929)*sailStates.beta + (7.999006)*sailStates.p + (-134.148560)*sailStates.q + (-3.743157)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.044244)*sailStates.alpha + (0.026267)*sailStates.beta + (-0.480352)*sailStates.p + (1.761010)*sailStates.q + (-0.016332)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end