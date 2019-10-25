function [aeroForces] = paramSpace_3_2_4_2_1_3_3(sailStates,airStates)

	CL = (4.774867)*sailStates.alpha + (0.124587)*sailStates.beta + (-2.987025)*sailStates.p + (39.502815)*sailStates.q + (1.610484)*sailStates.r + (0.011439)*sailStates.de;
	CD = -0.621770;
	CY = (0.006827)*sailStates.alpha + (-0.025379)*sailStates.beta + (0.715780)*sailStates.p + (-0.870356)*sailStates.q + (-0.047007)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.775383)*sailStates.alpha + (-0.286463)*sailStates.beta + (-1.556228)*sailStates.p + (13.370828)*sailStates.q + (1.417713)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.258153)*sailStates.alpha + (-0.502273)*sailStates.beta + (9.781431)*sailStates.p + (-147.878265)*sailStates.q + (-5.480303)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.227641)*sailStates.alpha + (0.022006)*sailStates.beta + (-1.472237)*sailStates.p + (6.855495)*sailStates.q + (0.010071)*sailStates.r + (0.000363)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end