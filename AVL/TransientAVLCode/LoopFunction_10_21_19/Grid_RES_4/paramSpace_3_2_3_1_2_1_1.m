function [aeroForces] = paramSpace_3_2_3_1_2_1_1(sailStates,airStates)

	CL = (5.895811)*sailStates.alpha + (-0.151686)*sailStates.beta + (-1.623903)*sailStates.p + (25.150154)*sailStates.q + (-2.001015)*sailStates.r + (0.010104)*sailStates.de;
	CD = -2.207710;
	CY = (0.394507)*sailStates.alpha + (-0.024889)*sailStates.beta + (-1.002898)*sailStates.p + (0.221996)*sailStates.q + (0.065741)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.187487)*sailStates.alpha + (0.447101)*sailStates.beta + (-0.483266)*sailStates.p + (2.580434)*sailStates.q + (-1.932487)*sailStates.r + (-0.000761)*sailStates.de;
	Cm = (-14.901520)*sailStates.alpha + (0.590341)*sailStates.beta + (6.295506)*sailStates.p + (-112.898659)*sailStates.q + (6.769395)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-1.994655)*sailStates.alpha + (-0.033504)*sailStates.beta + (2.272296)*sailStates.p + (-10.546006)*sailStates.q + (-0.020204)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end