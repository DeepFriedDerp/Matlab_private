function [aeroForces] = paramSpace_1_1_3_2_2_2_1(sailStates,airStates)

	CL = (3.861876)*sailStates.alpha + (-0.120689)*sailStates.beta + (-2.095641)*sailStates.p + (31.654531)*sailStates.q + (-0.724941)*sailStates.r + (0.010525)*sailStates.de;
	CD = 0.044680;
	CY = (-0.010402)*sailStates.alpha + (-0.024222)*sailStates.beta + (-0.135025)*sailStates.p + (-0.267957)*sailStates.q + (-0.023834)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.046824)*sailStates.alpha + (0.038041)*sailStates.beta + (-0.888955)*sailStates.p + (7.289474)*sailStates.q + (-0.463155)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-13.845251)*sailStates.alpha + (0.371849)*sailStates.beta + (6.998143)*sailStates.p + (-123.711861)*sailStates.q + (2.421342)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.018743)*sailStates.alpha + (0.011752)*sailStates.beta + (0.203400)*sailStates.p + (-0.425895)*sailStates.q + (-0.018351)*sailStates.r + (0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end