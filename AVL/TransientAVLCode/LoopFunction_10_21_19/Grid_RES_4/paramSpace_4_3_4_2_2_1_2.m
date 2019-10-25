function [aeroForces] = paramSpace_4_3_4_2_2_1_2(sailStates,airStates)

	CL = (4.073675)*sailStates.alpha + (0.000466)*sailStates.beta + (-2.401938)*sailStates.p + (31.752687)*sailStates.q + (-0.023893)*sailStates.r + (0.009790)*sailStates.de;
	CD = -0.262920;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.225308)*sailStates.p + (0.000000)*sailStates.q + (0.044817)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.227939)*sailStates.alpha + (0.113437)*sailStates.beta + (-1.122378)*sailStates.p + (8.760580)*sailStates.q + (-0.239096)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.768339)*sailStates.alpha + (0.010866)*sailStates.beta + (8.825668)*sailStates.p + (-134.847153)*sailStates.q + (-0.025366)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.312311)*sailStates.alpha + (-0.019781)*sailStates.beta + (0.722074)*sailStates.p + (-4.044314)*sailStates.q + (-0.051888)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end