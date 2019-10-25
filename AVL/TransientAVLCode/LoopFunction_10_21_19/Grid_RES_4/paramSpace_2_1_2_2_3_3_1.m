function [aeroForces] = paramSpace_2_1_2_2_3_3_1(sailStates,airStates)

	CL = (4.186155)*sailStates.alpha + (0.134972)*sailStates.beta + (-2.110748)*sailStates.p + (30.287233)*sailStates.q + (0.525963)*sailStates.r + (0.010432)*sailStates.de;
	CD = -0.310380;
	CY = (0.033443)*sailStates.alpha + (-0.025570)*sailStates.beta + (0.286357)*sailStates.p + (0.668512)*sailStates.q + (0.018745)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.068267)*sailStates.alpha + (-0.133208)*sailStates.beta + (-0.905930)*sailStates.p + (6.962506)*sailStates.q + (0.581219)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.508363)*sailStates.alpha + (-0.534269)*sailStates.beta + (7.481658)*sailStates.p + (-124.743294)*sailStates.q + (-1.781568)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.302107)*sailStates.alpha + (-0.011781)*sailStates.beta + (-0.718491)*sailStates.p + (2.967224)*sailStates.q + (-0.005085)*sailStates.r + (-0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end