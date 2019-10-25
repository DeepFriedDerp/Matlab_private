function [aeroForces] = paramSpace_2_4_3_3_1_3_2(sailStates,airStates)

	CL = (4.243631)*sailStates.alpha + (-0.111751)*sailStates.beta + (-2.535236)*sailStates.p + (33.886261)*sailStates.q + (0.455977)*sailStates.r + (0.010733)*sailStates.de;
	CD = -0.203680;
	CY = (-0.060486)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.321261)*sailStates.p + (-0.498142)*sailStates.q + (0.021039)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.264662)*sailStates.alpha + (-0.169889)*sailStates.beta + (-1.147790)*sailStates.p + (8.892593)*sailStates.q + (0.504919)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.943114)*sailStates.alpha + (0.475811)*sailStates.beta + (8.893784)*sailStates.p + (-136.384674)*sailStates.q + (-1.549497)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.256297)*sailStates.alpha + (-0.007198)*sailStates.beta + (-0.764471)*sailStates.p + (3.999718)*sailStates.q + (-0.012097)*sailStates.r + (0.000200)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end