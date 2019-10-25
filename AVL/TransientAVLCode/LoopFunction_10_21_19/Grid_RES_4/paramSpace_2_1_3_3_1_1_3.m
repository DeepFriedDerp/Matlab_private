function [aeroForces] = paramSpace_2_1_3_3_1_1_3(sailStates,airStates)

	CL = (4.110284)*sailStates.alpha + (-0.197081)*sailStates.beta + (-2.829535)*sailStates.p + (37.556381)*sailStates.q + (-0.882971)*sailStates.r + (0.011174)*sailStates.de;
	CD = -0.138070;
	CY = (-0.087537)*sailStates.alpha + (-0.024370)*sailStates.beta + (-0.305921)*sailStates.p + (-0.432841)*sailStates.q + (-0.020066)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.387303)*sailStates.alpha + (0.110231)*sailStates.beta + (-1.468849)*sailStates.p + (12.486178)*sailStates.q + (-0.750235)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-13.984239)*sailStates.alpha + (0.733499)*sailStates.beta + (9.472687)*sailStates.p + (-143.531296)*sailStates.q + (2.987063)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.179119)*sailStates.alpha + (0.010996)*sailStates.beta + (0.621446)*sailStates.p + (-2.229520)*sailStates.q + (-0.002132)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end