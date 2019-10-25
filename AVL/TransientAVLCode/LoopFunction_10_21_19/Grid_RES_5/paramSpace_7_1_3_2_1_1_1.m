function [aeroForces] = paramSpace_7_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.164299)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.371980)*sailStates.p + (33.568272)*sailStates.q + (-0.588031)*sailStates.r + (0.011075)*sailStates.de;
	CD = -0.081720;
	CY = (-0.036002)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.216040)*sailStates.p + (-0.438542)*sailStates.q + (-0.007560)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.149444)*sailStates.alpha + (0.125772)*sailStates.beta + (-1.041701)*sailStates.p + (8.249675)*sailStates.q + (-0.512608)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-14.598567)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.061375)*sailStates.p + (-131.751755)*sailStates.q + (1.993634)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (-0.092249)*sailStates.alpha + (0.004392)*sailStates.beta + (0.473776)*sailStates.p + (-1.783629)*sailStates.q + (-0.000086)*sailStates.r + (0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end