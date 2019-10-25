function [aeroForces] = paramSpace_3_4_3_2_1_1_1(sailStates,airStates)

	CL = (4.186155)*sailStates.alpha + (0.134972)*sailStates.beta + (-2.110748)*sailStates.p + (30.287233)*sailStates.q + (-0.525963)*sailStates.r + (0.010432)*sailStates.de;
	CD = -0.310380;
	CY = (-0.033443)*sailStates.alpha + (-0.024002)*sailStates.beta + (-0.286357)*sailStates.p + (-0.668512)*sailStates.q + (0.018745)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.899206)*sailStates.alpha + (0.205693)*sailStates.beta + (-0.808237)*sailStates.p + (5.753944)*sailStates.q + (-0.587665)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.508364)*sailStates.alpha + (-0.534268)*sailStates.beta + (7.481657)*sailStates.p + (-124.743294)*sailStates.q + (1.781568)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.335647)*sailStates.alpha + (-0.010432)*sailStates.beta + (0.712088)*sailStates.p + (-2.888011)*sailStates.q + (-0.004663)*sailStates.r + (0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end