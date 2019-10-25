function [aeroForces] = paramSpace_2_2_1_3_2_1_2(sailStates,airStates)

	CL = (4.280786)*sailStates.alpha + (-0.084952)*sailStates.beta + (-2.583318)*sailStates.p + (35.774750)*sailStates.q + (-0.999153)*sailStates.r + (0.011152)*sailStates.de;
	CD = -0.187170;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.406399)*sailStates.p + (-0.000001)*sailStates.q + (-0.026637)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.348016)*sailStates.alpha + (0.181143)*sailStates.beta + (-1.229565)*sailStates.p + (10.195842)*sailStates.q + (-0.876226)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.288314)*sailStates.alpha + (0.352743)*sailStates.beta + (8.606688)*sailStates.p + (-137.194580)*sailStates.q + (3.418007)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.060201)*sailStates.alpha + (0.013518)*sailStates.beta + (0.826240)*sailStates.p + (-3.381875)*sailStates.q + (0.001703)*sailStates.r + (-0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end