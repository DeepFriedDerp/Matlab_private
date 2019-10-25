function [aeroForces] = paramSpace_1_4_4_1_2_1_1(sailStates,airStates)

	CL = (6.208261)*sailStates.alpha + (0.648194)*sailStates.beta + (-1.779826)*sailStates.p + (35.609806)*sailStates.q + (-2.876954)*sailStates.r + (0.011756)*sailStates.de;
	CD = -2.314810;
	CY = (0.330955)*sailStates.alpha + (-0.026687)*sailStates.beta + (-1.125590)*sailStates.p + (-0.662185)*sailStates.q + (-0.223965)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (1.227098)*sailStates.alpha + (0.760684)*sailStates.beta + (-0.461657)*sailStates.p + (4.591307)*sailStates.q + (-2.436819)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-9.339683)*sailStates.alpha + (-2.380744)*sailStates.beta + (3.896577)*sailStates.p + (-109.940704)*sailStates.q + (9.491773)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-2.072833)*sailStates.alpha + (0.107736)*sailStates.beta + (2.551328)*sailStates.p + (-11.131862)*sailStates.q + (0.040970)*sailStates.r + (0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end