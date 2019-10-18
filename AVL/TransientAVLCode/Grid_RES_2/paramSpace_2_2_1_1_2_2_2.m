function [aeroForces] = paramSpace_2_2_1_1_2_2_2(sailStates,airStates)

	CL = (5.532839)*sailStates.alpha + (-3.943939)*sailStates.beta + (-3.509324)*sailStates.p + (48.096943)*sailStates.q + (2.227208)*sailStates.r + (0.010607)*sailStates.de;
	CD = -6.480760;
	CY = (1.859660)*sailStates.alpha + (-0.259519)*sailStates.beta + (0.285171)*sailStates.p + (16.304691)*sailStates.q + (-0.028305)*sailStates.r + (0.003108)*sailStates.de;

	Cl = (-5.888541)*sailStates.alpha + (-1.260701)*sailStates.beta + (-1.711826)*sailStates.p + (14.561566)*sailStates.q + (2.481956)*sailStates.r + (0.001295)*sailStates.de;
	Cm = (6.486622)*sailStates.alpha + (17.745581)*sailStates.beta + (10.917997)*sailStates.p + (-153.029877)*sailStates.q + (-7.896540)*sailStates.r + (-0.055464)*sailStates.de;
	Cn = (-1.934950)*sailStates.alpha + (0.364927)*sailStates.beta + (-0.872824)*sailStates.p + (-9.494989)*sailStates.q + (-0.204582)*sailStates.r + (-0.004058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end