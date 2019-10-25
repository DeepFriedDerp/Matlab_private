function [aeroForces] = paramSpace_1_3_3_1_3_1_3(sailStates,airStates)

	CL = (7.506809)*sailStates.alpha + (0.690737)*sailStates.beta + (-3.454607)*sailStates.p + (49.492954)*sailStates.q + (-3.842155)*sailStates.r + (0.012565)*sailStates.de;
	CD = -3.071790;
	CY = (-0.247958)*sailStates.alpha + (-0.019694)*sailStates.beta + (-1.574378)*sailStates.p + (2.260756)*sailStates.q + (-0.277390)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (3.140363)*sailStates.alpha + (0.919986)*sailStates.beta + (-1.850508)*sailStates.p + (17.959646)*sailStates.q + (-3.249770)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-12.613697)*sailStates.alpha + (-2.512001)*sailStates.beta + (9.252607)*sailStates.p + (-156.476898)*sailStates.q + (12.720823)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (1.744013)*sailStates.alpha + (0.111904)*sailStates.beta + (3.230623)*sailStates.p + (-15.201324)*sailStates.q + (0.053686)*sailStates.r + (-0.000980)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end