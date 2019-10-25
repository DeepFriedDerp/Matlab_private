function [aeroForces] = paramSpace_2_1_4_3_3_2_1(sailStates,airStates)

	CL = (4.012753)*sailStates.alpha + (-0.050358)*sailStates.beta + (-2.282208)*sailStates.p + (32.597408)*sailStates.q + (-0.414520)*sailStates.r + (0.010796)*sailStates.de;
	CD = 0.022290;
	CY = (0.067235)*sailStates.alpha + (-0.025111)*sailStates.beta + (-0.122840)*sailStates.p + (0.432842)*sailStates.q + (-0.008006)*sailStates.r + (0.000092)*sailStates.de;

	Cl = (1.199180)*sailStates.alpha + (0.016929)*sailStates.beta + (-1.032161)*sailStates.p + (8.351274)*sailStates.q + (-0.273153)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.520218)*sailStates.alpha + (0.093137)*sailStates.beta + (7.768728)*sailStates.p + (-128.769608)*sailStates.q + (1.370428)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.084937)*sailStates.alpha + (0.002989)*sailStates.beta + (0.222736)*sailStates.p + (-1.274656)*sailStates.q + (0.000786)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end