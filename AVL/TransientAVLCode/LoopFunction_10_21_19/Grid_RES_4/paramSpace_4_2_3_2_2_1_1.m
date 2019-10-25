function [aeroForces] = paramSpace_4_2_3_2_2_1_1(sailStates,airStates)

	CL = (4.082753)*sailStates.alpha + (-0.014351)*sailStates.beta + (-2.015226)*sailStates.p + (28.401257)*sailStates.q + (-0.188374)*sailStates.r + (0.009699)*sailStates.de;
	CD = -0.314280;
	CY = (0.084656)*sailStates.alpha + (-0.024646)*sailStates.beta + (-0.287660)*sailStates.p + (0.301044)*sailStates.q + (0.057230)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.059521)*sailStates.alpha + (0.126092)*sailStates.beta + (-0.836248)*sailStates.p + (6.092537)*sailStates.q + (-0.384044)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-14.930257)*sailStates.alpha + (0.057703)*sailStates.beta + (7.584595)*sailStates.p + (-123.990753)*sailStates.q + (0.543696)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.511616)*sailStates.alpha + (-0.028643)*sailStates.beta + (0.786829)*sailStates.p + (-4.213277)*sailStates.q + (-0.047060)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end