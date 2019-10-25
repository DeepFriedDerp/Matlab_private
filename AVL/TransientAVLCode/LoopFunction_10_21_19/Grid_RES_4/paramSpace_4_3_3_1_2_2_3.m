function [aeroForces] = paramSpace_4_3_3_1_2_2_3(sailStates,airStates)

	CL = (3.502774)*sailStates.alpha + (-0.088051)*sailStates.beta + (-3.331893)*sailStates.p + (42.571400)*sailStates.q + (1.334224)*sailStates.r + (0.011041)*sailStates.de;
	CD = 0.095890;
	CY = (0.041282)*sailStates.alpha + (-0.024249)*sailStates.beta + (0.334251)*sailStates.p + (-0.662187)*sailStates.q + (-0.066510)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.300541)*sailStates.alpha + (-0.172885)*sailStates.beta + (-1.846645)*sailStates.p + (16.446451)*sailStates.q + (0.967050)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-12.457657)*sailStates.alpha + (0.323066)*sailStates.beta + (10.917950)*sailStates.p + (-158.727356)*sailStates.q + (-4.482713)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.521368)*sailStates.alpha + (0.029432)*sailStates.beta + (-0.403095)*sailStates.p + (0.899300)*sailStates.q + (-0.039106)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end