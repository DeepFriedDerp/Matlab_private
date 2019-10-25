function [aeroForces] = paramSpace_2_4_3_3_1_1_3(sailStates,airStates)

	CL = (4.110284)*sailStates.alpha + (0.197081)*sailStates.beta + (-2.829535)*sailStates.p + (37.556381)*sailStates.q + (-0.882971)*sailStates.r + (0.011174)*sailStates.de;
	CD = -0.138070;
	CY = (-0.087537)*sailStates.alpha + (-0.025202)*sailStates.beta + (-0.305921)*sailStates.p + (-0.432841)*sailStates.q + (-0.020066)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.251579)*sailStates.alpha + (0.226602)*sailStates.beta + (-1.371150)*sailStates.p + (11.277619)*sailStates.q + (-0.743874)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-13.984241)*sailStates.alpha + (-0.733499)*sailStates.beta + (9.472686)*sailStates.p + (-143.531296)*sailStates.q + (2.987064)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.125535)*sailStates.alpha + (0.011081)*sailStates.beta + (0.627850)*sailStates.p + (-2.308733)*sailStates.q + (-0.001715)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end