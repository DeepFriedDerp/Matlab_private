function [aeroForces] = paramSpace_7_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.234641)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.356885)*sailStates.p + (32.891399)*sailStates.q + (0.476008)*sailStates.r + (0.010920)*sailStates.de;
	CD = -0.129210;
	CY = (-0.078863)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.277164)*sailStates.p + (-0.438541)*sailStates.q + (0.009694)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.228458)*sailStates.alpha + (-0.120830)*sailStates.beta + (-1.036903)*sailStates.p + (8.069042)*sailStates.q + (0.467812)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-14.995121)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.186971)*sailStates.p + (-131.751755)*sailStates.q + (-1.602971)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (0.289379)*sailStates.alpha + (-0.004219)*sailStates.beta + (-0.643880)*sailStates.p + (3.389033)*sailStates.q + (-0.004929)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end