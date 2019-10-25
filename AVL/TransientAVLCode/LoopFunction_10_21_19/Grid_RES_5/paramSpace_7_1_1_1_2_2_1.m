function [aeroForces] = paramSpace_7_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.403061)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.041679)*sailStates.p + (30.068138)*sailStates.q + (0.869538)*sailStates.r + (0.010674)*sailStates.de;
	CD = -0.521740;
	CY = (0.028506)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.396345)*sailStates.p + (0.910010)*sailStates.q + (0.013745)*sailStates.r + (0.000195)*sailStates.de;

	Cl = (0.921125)*sailStates.alpha + (-0.235008)*sailStates.beta + (-0.786190)*sailStates.p + (5.711926)*sailStates.q + (0.861101)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.424616)*sailStates.alpha + (0.000000)*sailStates.beta + (7.193513)*sailStates.p + (-123.255226)*sailStates.q + (-2.940102)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (0.482917)*sailStates.alpha + (-0.008207)*sailStates.beta + (-0.956505)*sailStates.p + (3.869331)*sailStates.q + (-0.002445)*sailStates.r + (-0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end