function [aeroForces] = paramSpace_1_2_2_1_3_2_1(sailStates,airStates)

	CL = (3.853191)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.598846)*sailStates.p + (28.245428)*sailStates.q + (-1.004541)*sailStates.r + (0.010359)*sailStates.de;
	CD = -0.037820;
	CY = (0.280821)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.370949)*sailStates.p + (1.081940)*sailStates.q + (-0.065408)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (0.763726)*sailStates.alpha + (0.142316)*sailStates.beta + (-0.442292)*sailStates.p + (3.235737)*sailStates.q + (-0.706651)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-12.935055)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.007693)*sailStates.p + (-109.437057)*sailStates.q + (3.345523)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (-0.739909)*sailStates.alpha + (0.025094)*sailStates.beta + (0.761706)*sailStates.p + (-4.244938)*sailStates.q + (0.023459)*sailStates.r + (-0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end