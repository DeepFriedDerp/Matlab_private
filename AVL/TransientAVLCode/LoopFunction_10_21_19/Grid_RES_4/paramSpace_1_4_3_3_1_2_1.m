function [aeroForces] = paramSpace_1_4_3_3_1_2_1(sailStates,airStates)

	CL = (3.784609)*sailStates.alpha + (0.162710)*sailStates.beta + (-2.225364)*sailStates.p + (32.772011)*sailStates.q + (-0.748637)*sailStates.r + (0.010400)*sailStates.de;
	CD = 0.064450;
	CY = (-0.073197)*sailStates.alpha + (-0.026893)*sailStates.beta + (-0.104088)*sailStates.p + (-0.684401)*sailStates.q + (-0.020729)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (0.950601)*sailStates.alpha + (0.122128)*sailStates.beta + (-0.910421)*sailStates.p + (7.229158)*sailStates.q + (-0.465813)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-13.590231)*sailStates.alpha + (-0.565684)*sailStates.beta + (7.472037)*sailStates.p + (-127.495163)*sailStates.q + (2.525614)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.114897)*sailStates.alpha + (0.020028)*sailStates.beta + (0.116923)*sailStates.p + (0.376808)*sailStates.q + (-0.033375)*sailStates.r + (0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end