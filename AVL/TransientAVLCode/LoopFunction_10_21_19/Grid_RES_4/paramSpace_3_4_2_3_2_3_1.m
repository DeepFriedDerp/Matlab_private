function [aeroForces] = paramSpace_3_4_2_3_2_3_1(sailStates,airStates)

	CL = (4.214402)*sailStates.alpha + (-0.205868)*sailStates.beta + (-2.304028)*sailStates.p + (33.367153)*sailStates.q + (0.945192)*sailStates.r + (0.010922)*sailStates.de;
	CD = -0.184280;
	CY = (-0.031241)*sailStates.alpha + (-0.024849)*sailStates.beta + (0.365415)*sailStates.p + (0.065300)*sailStates.q + (-0.023953)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.089040)*sailStates.alpha + (-0.243764)*sailStates.beta + (-0.942852)*sailStates.p + (7.340937)*sailStates.q + (0.794612)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.132428)*sailStates.alpha + (0.763991)*sailStates.beta + (7.677834)*sailStates.p + (-129.003830)*sailStates.q + (-3.195308)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.269789)*sailStates.alpha + (0.011324)*sailStates.beta + (-0.777901)*sailStates.p + (3.392400)*sailStates.q + (0.002936)*sailStates.r + (0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end