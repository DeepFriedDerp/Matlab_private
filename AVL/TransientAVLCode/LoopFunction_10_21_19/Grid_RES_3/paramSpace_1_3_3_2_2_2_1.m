function [aeroForces] = paramSpace_1_3_3_2_2_2_1(sailStates,airStates)

	CL = (3.861876)*sailStates.alpha + (0.120689)*sailStates.beta + (-2.095641)*sailStates.p + (31.654531)*sailStates.q + (-0.724941)*sailStates.r + (0.010525)*sailStates.de;
	CD = 0.044680;
	CY = (-0.010402)*sailStates.alpha + (-0.025440)*sailStates.beta + (-0.135025)*sailStates.p + (-0.267957)*sailStates.q + (-0.023834)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (0.905865)*sailStates.alpha + (0.114898)*sailStates.beta + (-0.804302)*sailStates.p + (6.228602)*sailStates.q + (-0.448330)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-13.845252)*sailStates.alpha + (-0.371849)*sailStates.beta + (6.998145)*sailStates.p + (-123.711845)*sailStates.q + (2.421342)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.024834)*sailStates.alpha + (0.015215)*sailStates.beta + (0.218326)*sailStates.p + (-0.612955)*sailStates.q + (-0.015737)*sailStates.r + (0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end