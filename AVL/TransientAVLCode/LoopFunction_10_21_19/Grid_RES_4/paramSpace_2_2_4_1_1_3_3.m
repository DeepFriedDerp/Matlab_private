function [aeroForces] = paramSpace_2_2_4_1_1_3_3(sailStates,airStates)

	CL = (6.956951)*sailStates.alpha + (0.175998)*sailStates.beta + (-3.410917)*sailStates.p + (39.358826)*sailStates.q + (2.229974)*sailStates.r + (0.011011)*sailStates.de;
	CD = -2.827160;
	CY = (0.283011)*sailStates.alpha + (-0.024607)*sailStates.beta + (1.235113)*sailStates.p + (-1.471503)*sailStates.q + (0.080798)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (2.823900)*sailStates.alpha + (-0.509439)*sailStates.beta + (-1.939566)*sailStates.p + (15.962170)*sailStates.q + (2.152978)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-15.949872)*sailStates.alpha + (-0.716780)*sailStates.beta + (12.403980)*sailStates.p + (-162.286758)*sailStates.q + (-7.578840)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.112931)*sailStates.alpha + (-0.038333)*sailStates.beta + (-2.826646)*sailStates.p + (14.253231)*sailStates.q + (-0.035984)*sailStates.r + (0.000671)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end