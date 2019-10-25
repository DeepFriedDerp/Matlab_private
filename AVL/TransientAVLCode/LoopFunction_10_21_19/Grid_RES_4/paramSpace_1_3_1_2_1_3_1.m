function [aeroForces] = paramSpace_1_3_1_2_1_3_1(sailStates,airStates)

	CL = (4.189152)*sailStates.alpha + (-0.016714)*sailStates.beta + (-2.036966)*sailStates.p + (28.325020)*sailStates.q + (0.374203)*sailStates.r + (0.009615)*sailStates.de;
	CD = -0.392390;
	CY = (-0.187894)*sailStates.alpha + (-0.026211)*sailStates.beta + (0.393442)*sailStates.p + (-1.057313)*sailStates.q + (0.078374)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (1.133764)*sailStates.alpha + (-0.164863)*sailStates.beta + (-0.818296)*sailStates.p + (5.658404)*sailStates.q + (0.526129)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-15.139979)*sailStates.alpha + (0.043324)*sailStates.beta + (7.834495)*sailStates.p + (-125.069839)*sailStates.q + (-1.123297)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.702067)*sailStates.alpha + (-0.027108)*sailStates.beta + (-1.012363)*sailStates.p + (5.843791)*sailStates.q + (-0.064732)*sailStates.r + (0.000393)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end