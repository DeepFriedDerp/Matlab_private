function [aeroForces] = paramSpace_1_2_4_1_2_3_1(sailStates,airStates)

	CL = (5.544997)*sailStates.alpha + (0.131594)*sailStates.beta + (-1.458599)*sailStates.p + (20.013556)*sailStates.q + (1.619092)*sailStates.r + (0.008828)*sailStates.de;
	CD = -2.119720;
	CY = (-0.424135)*sailStates.alpha + (-0.024341)*sailStates.beta + (0.936930)*sailStates.p + (-0.662188)*sailStates.q + (0.186296)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (1.046968)*sailStates.alpha + (-0.403605)*sailStates.beta + (-0.425950)*sailStates.p + (1.270624)*sailStates.q + (1.722925)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-16.690382)*sailStates.alpha + (-0.538319)*sailStates.beta + (6.903971)*sailStates.p + (-110.966957)*sailStates.q + (-5.289544)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (1.998244)*sailStates.alpha + (-0.091779)*sailStates.beta + (-2.155381)*sailStates.p + (10.077605)*sailStates.q + (-0.069443)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end