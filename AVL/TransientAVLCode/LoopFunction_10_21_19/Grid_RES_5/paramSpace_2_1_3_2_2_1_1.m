function [aeroForces] = paramSpace_2_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.202636)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.295771)*sailStates.p + (35.689678)*sailStates.q + (-1.606107)*sailStates.r + (0.010941)*sailStates.de;
	CD = -0.159750;
	CY = (0.078515)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.513881)*sailStates.p + (0.230433)*sailStates.q + (-0.109221)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.254465)*sailStates.alpha + (0.247810)*sailStates.beta + (-0.995116)*sailStates.p + (8.863951)*sailStates.q + (-1.226927)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-12.890901)*sailStates.alpha + (0.000000)*sailStates.beta + (6.910664)*sailStates.p + (-128.239044)*sailStates.q + (5.322126)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (-0.218594)*sailStates.alpha + (0.052674)*sailStates.beta + (0.999881)*sailStates.p + (-4.125897)*sailStates.q + (-0.003340)*sailStates.r + (-0.000145)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end