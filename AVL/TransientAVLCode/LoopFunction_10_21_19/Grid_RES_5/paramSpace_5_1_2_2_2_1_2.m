function [aeroForces] = paramSpace_5_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.274731)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.780057)*sailStates.p + (37.878914)*sailStates.q + (-1.226447)*sailStates.r + (0.011268)*sailStates.de;
	CD = -0.165490;
	CY = (0.022717)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.460430)*sailStates.p + (0.493723)*sailStates.q + (-0.048411)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.459005)*sailStates.alpha + (0.210327)*sailStates.beta + (-1.376924)*sailStates.p + (11.726689)*sailStates.q + (-1.003560)*sailStates.r + (0.000609)*sailStates.de;
	Cm = (-14.106954)*sailStates.alpha + (0.000000)*sailStates.beta + (9.086436)*sailStates.p + (-142.416916)*sailStates.q + (4.144101)*sailStates.r + (-0.070303)*sailStates.de;
	Cn = (0.066988)*sailStates.alpha + (0.022106)*sailStates.beta + (0.889515)*sailStates.p + (-3.896556)*sailStates.q + (0.003213)*sailStates.r + (-0.000214)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end