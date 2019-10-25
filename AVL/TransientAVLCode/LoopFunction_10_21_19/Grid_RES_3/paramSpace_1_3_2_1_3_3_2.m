function [aeroForces] = paramSpace_1_3_2_1_3_3_2(sailStates,airStates)

	CL = (5.107680)*sailStates.alpha + (-0.248457)*sailStates.beta + (-2.289788)*sailStates.p + (28.188793)*sailStates.q + (0.940512)*sailStates.r + (0.009203)*sailStates.de;
	CD = -1.567310;
	CY = (0.185851)*sailStates.alpha + (-0.020620)*sailStates.beta + (0.572601)*sailStates.p + (1.671347)*sailStates.q + (0.100965)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.030861)*sailStates.alpha + (-0.406884)*sailStates.beta + (-1.048924)*sailStates.p + (7.504244)*sailStates.q + (1.140883)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-15.350821)*sailStates.alpha + (1.022159)*sailStates.beta + (9.061409)*sailStates.p + (-132.498779)*sailStates.q + (-3.089033)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (0.325259)*sailStates.alpha + (-0.057663)*sailStates.beta + (-1.511926)*sailStates.p + (6.082253)*sailStates.q + (-0.032813)*sailStates.r + (-0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end