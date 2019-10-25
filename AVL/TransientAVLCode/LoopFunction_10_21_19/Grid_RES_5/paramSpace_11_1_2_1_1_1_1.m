function [aeroForces] = paramSpace_11_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.350282)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.976679)*sailStates.p + (28.540266)*sailStates.q + (-0.609689)*sailStates.r + (0.010280)*sailStates.de;
	CD = -0.528310;
	CY = (-0.014252)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.366439)*sailStates.p + (-0.768921)*sailStates.q + (0.038541)*sailStates.r + (-0.000164)*sailStates.de;

	Cl = (0.890222)*sailStates.alpha + (0.214195)*sailStates.beta + (-0.759581)*sailStates.p + (5.327194)*sailStates.q + (-0.726638)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-14.884963)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.247736)*sailStates.p + (-122.164581)*sailStates.q + (2.066402)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-0.494235)*sailStates.alpha + (-0.022513)*sailStates.beta + (0.906680)*sailStates.p + (-3.655249)*sailStates.q + (-0.010623)*sailStates.r + (0.000151)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end