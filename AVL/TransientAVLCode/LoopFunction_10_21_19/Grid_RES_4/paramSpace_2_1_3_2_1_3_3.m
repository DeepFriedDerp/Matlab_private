function [aeroForces] = paramSpace_2_1_3_2_1_3_3(sailStates,airStates)

	CL = (4.541482)*sailStates.alpha + (0.197557)*sailStates.beta + (-2.930881)*sailStates.p + (36.703072)*sailStates.q + (0.830991)*sailStates.r + (0.010847)*sailStates.de;
	CD = -0.537560;
	CY = (0.006163)*sailStates.alpha + (-0.024143)*sailStates.beta + (0.517376)*sailStates.p + (-0.668511)*sailStates.q + (0.033887)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.693427)*sailStates.alpha + (-0.177066)*sailStates.beta + (-1.572809)*sailStates.p + (13.032603)*sailStates.q + (0.847185)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-14.957781)*sailStates.alpha + (-0.811555)*sailStates.beta + (10.346972)*sailStates.p + (-147.557632)*sailStates.q + (-2.820123)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.023615)*sailStates.alpha + (-0.018015)*sailStates.beta + (-1.227483)*sailStates.p + (6.380321)*sailStates.q + (-0.018182)*sailStates.r + (0.000292)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end