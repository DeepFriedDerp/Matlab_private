function [aeroForces] = paramSpace_2_3_1_2_1_1_2(sailStates,airStates)

	CL = (4.384083)*sailStates.alpha + (0.103448)*sailStates.beta + (-2.600364)*sailStates.p + (36.159054)*sailStates.q + (-1.154847)*sailStates.r + (0.011240)*sailStates.de;
	CD = -0.368500;
	CY = (-0.098190)*sailStates.alpha + (-0.025332)*sailStates.beta + (-0.450529)*sailStates.p + (-0.769435)*sailStates.q + (-0.029448)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.208402)*sailStates.alpha + (0.281189)*sailStates.beta + (-1.204684)*sailStates.p + (9.891209)*sailStates.q + (-1.043543)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-13.889810)*sailStates.alpha + (-0.430009)*sailStates.beta + (8.615777)*sailStates.p + (-137.556381)*sailStates.q + (3.956082)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.014784)*sailStates.alpha + (0.016854)*sailStates.beta + (0.951332)*sailStates.p + (-3.399808)*sailStates.q + (-0.001307)*sailStates.r + (0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end